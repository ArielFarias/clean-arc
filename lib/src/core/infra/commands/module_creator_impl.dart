import 'dart:io';
import 'package:clean_arc/src/core/creators/module_creator.dart';

class ModuleCreatorImpl implements ModuleCreator {
  final _domain = 'domain';
  final _domainModels = 'domain/models/';
  final _domainRepositories = 'domain/repositories/';
  final _domainServices = 'domain/services/';
  final _domainStores = 'domain/stores/';
  final _domainUsecases = 'domain/usecases/';

  final _external = 'external';
  final _externalDatasources = 'external/datasources';
  
  final _infra = 'infra';
  final _infraDatasources = 'infra/datasources';
  final _infraRepositories = 'infra/repositories';
  final _infraServices = 'infra/services';

  final _presenter = 'presenter';
  final _presenterPages = 'presenter/pages';
  final _presenterWidgets = 'presenter/widgets';

  final String basePath;
  late final String absolutePath;

  @override
  Directory get domain => Directory('$absolutePath/$_domain');
  @override
  Directory get domainModels => Directory('$absolutePath/$_domainModels');
  @override
  Directory get domainRepositories => Directory('$absolutePath/$_domainRepositories');
  @override
  Directory get domainServices => Directory('$absolutePath/$_domainServices');
  @override
  Directory get domainStores => Directory('$absolutePath/$_domainStores');
  @override
  Directory get domainUsecases => Directory('$absolutePath/$_domainUsecases');

  @override
  Directory get external => Directory('$absolutePath/$_external');
  @override
  Directory get externalDatasources => Directory('$absolutePath/$_externalDatasources');

  @override
  Directory get infra => Directory('$absolutePath/$_infra');
  @override
  Directory get infraDatasources => Directory('$absolutePath/$_infraDatasources');
  @override
  Directory get infraRepositories => Directory('$absolutePath/$_infraRepositories');
  @override
  Directory get infraServices => Directory('$absolutePath/$_infraServices');

  @override
  Directory get presenter => Directory('$absolutePath/$_presenter');
  @override
  Directory get presenterPages => Directory('$absolutePath/$_presenterPages');
  @override
  Directory get presenterWidgets => Directory('$absolutePath/$_presenterWidgets');

  ModuleCreatorImpl({required this.basePath});

  @override
  Future<bool> createModule() async {
    try {
      final moduleDir = Directory(basePath);

      if (await moduleDir.exists()) {
        absolutePath = moduleDir.absolute.path;
      } else {
        final res = await Directory(basePath).create(recursive: true);
        absolutePath = res.absolute.path;
      }
          
      final absDomain = domain.absolute.path;
      final absDomainModels = domainModels.absolute.path;
      final absDomainRepositories = domainRepositories.absolute.path;
      final absDomainServices = domainServices.absolute.path;
      final absDomainStores = domainStores.absolute.path;
      final absDomainUsecases = domainUsecases.absolute.path;
      final absExternal = external.absolute.path;
      final absExternalDatasources = externalDatasources.absolute.path;
      final absInfra = infra.absolute.path;
      final absInfraDatasources = infraDatasources.absolute.path;
      final absInfraRepositories = infraRepositories.absolute.path;
      final absInfraServices = infraServices.absolute.path;
      final absPresenter = presenter.absolute.path;
      final absPresenterPages = presenterPages.absolute.path;
      final absPresenterWidgets = presenterWidgets.absolute.path;

      print('creating folders...\n');

      await Directory(absolutePath).create();
      await Directory(absDomain).create();
      await Directory(absDomainModels).create();
      await Directory(absDomainRepositories).create();
      await Directory(absDomainServices).create();
      await Directory(absDomainStores).create();
      await Directory(absDomainUsecases).create();

      await Directory(absExternal).create();
      await Directory(absExternalDatasources).create();

      await Directory(absInfra).create();
      await Directory(absInfraDatasources).create();
      await Directory(absInfraRepositories).create();
      await Directory(absInfraServices).create();
      
      await Directory(absPresenter).create();
      await Directory(absPresenterPages).create();
      await Directory(absPresenterWidgets).create();
      await File('$absolutePath/${basePath}_.dart').create();
      
      return true;
    } catch (e, stack) {
        stderr.writeln(e);
        stderr.writeln(stack);
      return false;
    }
  }
}