import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_x/feature/home/presentation/bloc/cat/cat_bloc.dart';
import 'package:test_x/feature/home/presentation/bloc/home/home_bloc.dart';
import 'package:test_x/feature/home/presentation/widget/home_body.dart';
import 'package:test_x/feature/profile/presentation/page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = [
    const HomeBody(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    context.read<CatBloc>().add(GetCatEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.95),
          body: IndexedStack(
            index: state.index,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            selectedItemColor: const Color(0xFF000000),
            unselectedItemColor: const Color(0xFF000000),
            onTap: (index) async {
              context.read<HomeBloc>().add(HomeIndexEvent(
                    index: index,
                  ));
            },
            selectedLabelStyle: const TextStyle(
              fontSize: 2,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 2,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
