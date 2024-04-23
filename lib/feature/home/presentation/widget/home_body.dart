import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_x/feature/home/presentation/bloc/cat/cat_bloc.dart';
import 'package:test_x/feature/home/presentation/widget/landing_web.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatState>(
      builder: (context, state) {
        return state.listCat != null && state.listCat!.isNotEmpty
            ? ListView.builder(
                itemCount: state.listCat!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          context.read<CatBloc>().add(GetCatImageEvent(
                              id: state.listCat![index].id.toString()));
                          state.listCat![index] =
                              state.listCat![index].copyWith(
                            select: !state.listCat![index].select,
                          );
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: Offset(0, 2),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.listCat![index].name.toString(),
                                  ),
                                  !state.listCat![index].select
                                      ? Icon(Icons.arrow_drop_down_outlined)
                                      : Icon(Icons.arrow_drop_up_sharp)
                                ],
                              ),
                              state.listCat![index].select
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(
                                        'Descripción: ${state.listCat![index].description}',
                                      ),
                                    )
                                  : const SizedBox(),
                              state.listCat![index].select
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LandingWeb(
                                                url: state.listCat![index]
                                                    .wikipediaUrl
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'wikipedia: ${state.listCat![index].wikipediaUrl}',
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.blue,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              state.listCat![index].select
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Origel: ${state.listCat![index].origin}',
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              state.listCat![index].select
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Inteligencia: ${state.listCat![index].intelligence}',
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              state.listCat![index].select
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'la expectativa de vida: ${state.listCat![index].lifeSpan} Años',
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              state.listCat![index].select
                                  ? state.listImageCat != null &&
                                          state.listImageCat!.isNotEmpty
                                      ? SizedBox(
                                          height: 140,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  state.listImageCat!.length,
                                              itemBuilder:
                                                  (context, indexImage) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: SizedBox(
                                                      height: 140,
                                                      child: Image(
                                                        image: NetworkImage(
                                                          state
                                                                  .listImageCat![
                                                                      indexImage]
                                                                  .url ??
                                                              "",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
