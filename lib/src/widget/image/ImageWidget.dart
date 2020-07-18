import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File> loadImage(ImageSource image) async {
  final _foto = await ImagePicker.pickImage(source: image);

  print('uploadImage: $_foto');
  return _foto;
}

Widget showPicture(File file, String picture, double heigth) {
  if (picture != null) {
    return FadeInImage(
      image: NetworkImage(picture),
      placeholder: AssetImage('assets/jar-loading.gif'),
      height: heigth,
      fit: BoxFit.contain,
    );
  } else {
    return Image(
      image: AssetImage(file?.path ?? 'https://image.made-in-china.com/43f34j00oCvQJWGmlslI/Zapatillas-Marcas-De-Deporte-China-Fabricante-Zapatos-PARA-Correr-Tenis-Running.jpg'),
      height: heigth,
      fit: BoxFit.cover,
    );
  }
}
