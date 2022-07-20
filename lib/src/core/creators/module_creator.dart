import 'dart:io';

abstract class ModuleCreator {
  
  Future<bool> createModule();

  Directory get domain;
  Directory get domainModels;
  Directory get domainRepositories;
  Directory get domainStores;
  Directory get domainUsecases;
  Directory get domainServices;

  Directory get external;
  Directory get externalDatasources;

  Directory get infra;
  Directory get infraDatasources;
  Directory get infraRepositories;
  Directory get infraServices;

  Directory get presenter;
  Directory get presenterPages;
  Directory get presenterWidgets;
}