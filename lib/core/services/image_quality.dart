enum ImageQuality { high, medium, low }

ImageQuality imageQualityByName(String name) {
  try {
    return ImageQuality.values.byName(name);
  } catch (e) {
    return ImageQuality.medium;
  }
}

String imageQualityNameByType(ImageQuality qualityPhoto) {
  return qualityPhoto.name;
}
