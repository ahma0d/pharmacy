import 'package:flutter/material.dart';

 loadingCenter({
  required context ,
}) => showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
