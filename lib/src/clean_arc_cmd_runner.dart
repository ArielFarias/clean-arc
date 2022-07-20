import 'dart:io';

import 'package:args/args.dart';
import 'package:clean_arc/src/core/domain/commands/command.dart';
import 'package:clean_arc/src/core/infra/commands/create_command.dart';
import 'package:clean_arc/src/core/infra/commands/help_command.dart';

class CleanArcCmdRunner {
  void run(List<String> arguments) {
    final parser = ArgParser();

    var command = parser.addCommand('create');
    command.addOption('module', defaultsTo: 'module');
    parser.addCommand('help');

    final res = parser.parse(arguments);

    if (res.command != null && res.command!.name != null) {
      Command? command;

      switch (res.command!.name) {
        case 'create':
          final hello = welcome();
          if (hello) {
            command = CreateCommand(res.command!['module']);
          } else {
            exit(0);
          }
          break;
        case 'help':
          command = HelpCommand();
          break;
        default:
          _error(res.command!.name);
          break;
      }

      command!.execute();
    }
  }
}

void _error(String? name) {
  stderr.writeln('Command not available!');
  stderr.writeln('try clean_arc help for commands.');
  exit(2);
}

bool welcome() {
  String content = '''
+---------------------------------------------------+
|           Welcome to the Clean Architeture!       |
+---------------------------------------------------+
|           Do you want to continue? [y/n]          |
+---------------------------------------------------+\n''';

  stderr.write(content);

  final answer = stdin.readLineSync();
  final validator =
      answer?.toLowerCase() == 'y' || answer?.toLowerCase() == 'yes';

  return answer != null && validator;
}
