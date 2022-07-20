import 'dart:io';

import 'package:clean_arc/src/core/creators/clean_architecture_creator.dart';
import 'package:clean_arc/src/core/creators/module_creator.dart';

class CleanArchitectureCreatorImpl implements CleanArchitectureCreator {
  final ModuleCreator creator;

  CleanArchitectureCreatorImpl({required this.creator});

  @override
  Future<void> create() async {
      final res = await creator.createModule();

      if (!res) {
        stderr.writeln('Failed to create folders!');
      } else {
        print('Awesome, folder structure successful created!');
      }
  }
}