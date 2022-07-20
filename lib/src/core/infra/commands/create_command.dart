import 'package:clean_arc/src/core/creators/clean_architecture_creator.dart';
import 'package:clean_arc/src/core/domain/commands/command.dart';
import 'package:clean_arc/src/core/infra/commands/module_creator_impl.dart';
import 'package:clean_arc/src/core/infra/creators/clean_architecture_creator_impl.dart';

class CreateCommand implements Command {
  final String module;
  
  CreateCommand(this.module);

  @override
  Future<void> execute() async {
    final moduleCreator = ModuleCreatorImpl(basePath: module);
    final creator = CleanArchitectureCreatorImpl(creator: moduleCreator);

    return creator.create();
  }
}