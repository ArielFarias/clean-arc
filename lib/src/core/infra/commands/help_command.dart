import 'package:clean_arc/src/core/domain/commands/command.dart';

import 'dart:io';

class HelpCommand implements Command {
   @override
  Future<void> execute() async {
    stdout.writeln('Usage: clean_arc <command>');
    stdout.writeln('Available commands:');
    stdout.writeln(
      'create  --module="Module Name"  Create folders in clean architecture for Fluter modular Apps',
    );

    exit(0);
  }
}