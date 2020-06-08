// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/core/services/register_dependencies.dart';
import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service_impl.dart';
import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/ui/views/login/login_viewmodel.dart.dart';
import 'package:svuce_app/core/services/register_third_party_services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service_impl.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/core/services/firestore/register_firestore_services.dart';
import 'package:svuce_app/core/services/firestore/user_club_service.dart';
import 'package:svuce_app/core/services/firestore/user_service.dart';
import 'package:svuce_app/core/services/api/api_service_impl.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/core/services/firestore/announcement_service.dart';
import 'package:svuce_app/core/services/auth/auth_service_impl.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/services/firestore/clubs_service.dart';
import 'package:svuce_app/core/services/firestore/event_service.dart';
import 'package:svuce_app/core/services/firestore/feed_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerDependencies = _$RegisterDependencies();
  final registerExternalServices = _$RegisterExternalServices();
  final registerFirestoreServices = _$RegisterFirestoreServices(g);
  g.registerLazySingleton<AttendanceService>(() => AttendanceService());
  g.registerLazySingleton<HiveService>(() => HiveService());
  g.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  g.registerLazySingleton<NavigationService>(
      () => registerExternalServices.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => registerExternalServices.snackbarService);
  g.registerLazySingleton<TimeTableService>(() => TimeTableService());
  g.registerLazySingleton<UserClubService>(
      () => registerFirestoreServices.userClubService);
  g.registerLazySingleton<UserService>(
      () => registerFirestoreServices.userService);
  g.registerLazySingleton<AnnouncementService>(
      () => registerFirestoreServices.announcementService);
  g.registerLazySingleton<ClubsService>(
      () => registerFirestoreServices.clubsService);
  g.registerLazySingleton<EventsService>(
      () => registerFirestoreServices.eventsService);
  g.registerLazySingleton<FeedService>(
      () => registerFirestoreServices.feedService);

  //Eager singletons must be registered in the right order
  g.registerSingleton<Client>(registerDependencies.client);
  g.registerSingleton<CloudStorageService>(CloudStorageServiceImpl());
  g.registerSingleton<FirebaseAuth>(registerDependencies.firebaseAuth);
  g.registerSingleton<Firestore>(registerDependencies.firestore);
  g.registerSingleton<HiveInterface>(registerDependencies.hive);
  g.registerSingleton<PushNotificationService>(PushNotificationServiceImp());
  g.registerSingleton<APIService>(APIServiceImpl(g<Client>()));
  g.registerSingleton<AuthService>(AuthServiceImpl(g<FirebaseAuth>()));
}

class _$RegisterDependencies extends RegisterDependencies {}

class _$RegisterExternalServices extends RegisterExternalServices {
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}

class _$RegisterFirestoreServices extends RegisterFirestoreServices {
  final GetIt _g;
  _$RegisterFirestoreServices(this._g);
  @override
  UserClubService get userClubService => UserClubService(_g<Firestore>());
  @override
  UserService get userService => UserService(_g<Firestore>());
  @override
  AnnouncementService get announcementService =>
      AnnouncementService(_g<Firestore>());
  @override
  ClubsService get clubsService => ClubsService(_g<Firestore>());
  @override
  EventsService get eventsService => EventsService(_g<Firestore>());
  @override
  FeedService get feedService => FeedService(_g<Firestore>());
}
