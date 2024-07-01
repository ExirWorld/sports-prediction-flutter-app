// import 'package:sanachange/core/utils/httpClient.dart';
// import 'package:sanachange/features/auth/login/data/data_source/remote/api_login_provider.dart';
// import 'package:sanachange/features/auth/login/data/repository/login_repository_Impl.dart';
// import 'package:sanachange/features/auth/login/domain/repository/login_repository.dart';
// import 'package:sanachange/features/auth/login/domain/use_case/login_usecase.dart';
// import 'package:sanachange/features/auth/login/presentation/bloc/login_bloc.dart';
// import 'package:sanachange/features/auth/singup/data/data_source/remote/api_provider.dart';
// import 'package:sanachange/features/auth/singup/data/repository/register_repository_Impl.dart';
// import 'package:sanachange/features/auth/singup/domain/repository/register_repository.dart';
// import 'package:sanachange/features/auth/singup/domain/use_cases/register_usecase.dart';
// import 'package:sanachange/features/auth/singup/presentation/bloc/singup_bloc.dart';
// import 'package:sanachange/features/auth/splash/data/data_source/remote/api_getuser_provider.dart';
// import 'package:sanachange/features/auth/splash/data/repository/getuser_repository_impl.dart';
// import 'package:sanachange/features/auth/splash/domain/repository/getuser_repository.dart';
// import 'package:sanachange/features/auth/splash/domain/use_case/getuser_usecase.dart';
// import 'package:sanachange/features/auth/splash/presentation/bloc/get_user_bloc.dart';
// import 'package:sanachange/features/auth/verifyMail/data/data_source/remote/api_verifyMail.dart';
// import 'package:sanachange/features/auth/verifyMail/data/repository/verifyMail_repository_Impl.dart';
// import 'package:sanachange/features/auth/verifyMail/domain/repository/verify_mail_repository.dart';
// import 'package:sanachange/features/auth/verifyMail/domain/use_cases/verifyMail_usecase.dart';
// import 'package:sanachange/features/auth/verifyMail/presentation/bloc/verify_mail_bloc.dart';
// import 'package:sanachange/features/auth/verifyMobile/data/data_source/remote/api_verifyMobile.dart';
// import 'package:sanachange/features/auth/verifyMobile/data/repository/verifyMobile_repository_Impl.dart';
// import 'package:sanachange/features/auth/verifyMobile/domain/repository/verifyMobile_repository.dart';
// import 'package:sanachange/features/auth/verifyMobile/domain/use_cases/verifyMobile_usecase.dart';
// import 'package:sanachange/features/auth/verifyMobile/presentation/bloc/verify_mobile_bloc.dart';
// import 'package:sanachange/features/buy_sell/get_info_symbol/data/data_source/remote/api_get_info_symbol.dart';
// import 'package:sanachange/features/buy_sell/get_info_symbol/data/repository/get_info_symbol_repository_impl.dart';
// import 'package:sanachange/features/buy_sell/get_info_symbol/domain/repository/get_info_symbol_repository.dart';
// import 'package:sanachange/features/buy_sell/get_info_symbol/domain/use_case/get_info_symbol_usecase.dart';
// import 'package:sanachange/features/buy_sell/get_info_symbol/presentation/bloc/get_info_symbol_bloc.dart';
// import 'package:sanachange/features/root/data/data_source/remote/api_general_info_provider.dart';
// import 'package:sanachange/features/root/data/repository/general_info_repository_impl.dart';
// import 'package:sanachange/features/root/domain/repository/general_info_repository.dart';
// import 'package:sanachange/features/root/domain/use_case/general_info_usecase.dart';
// import 'package:sanachange/features/root/presentation/bloc/root_bloc.dart';
// import 'package:sanachange/features/selected_currency/data/data_source/remote/api_order_info_provider.dart';
// import 'package:sanachange/features/selected_currency/data/repository/order_info_repository_impl.dart';
// import 'package:sanachange/features/selected_currency/domain/repository/order_info_repository.dart';
// import 'package:sanachange/features/selected_currency/domain/use_case/order_info_usecase.dart';
// import 'package:sanachange/features/selected_currency/presentation/bloc/selected_currency_bloc.dart';
// import 'package:get_it/get_it.dart';

// GetIt locator = GetIt.instance;

// setup() {
//   locator.registerSingleton<ApiProvider>(ApiProvider(httpclient));
//   locator.registerSingleton<ApiVerifyMobile>(ApiVerifyMobile(httpclient));
//   locator.registerSingleton<ApiVerifyMail>(ApiVerifyMail(httpclient));
//   locator.registerSingleton<ApiLoginProvider>(ApiLoginProvider(httpclient));
//   locator.registerSingleton<ApiGetUserProvider>(ApiGetUserProvider(httpclient));
//   locator.registerSingleton<ApiGeneralInfoProvider>(
//       ApiGeneralInfoProvider(httpclient));
//   locator.registerSingleton<ApiOrderInfoProvider>(
//       ApiOrderInfoProvider(httpclient));
//   locator.registerSingleton<ApiGetInfoSymbol>(ApiGetInfoSymbol(httpclient));

//   //repositories
//   locator
//       .registerSingleton<RegisterRepository>(RegisterRepositoryImpl(locator()));

//   locator.registerSingleton<VerifyMobileRepository>(
//       VerifyMobileRepositoryImpl(locator()));
//   locator.registerSingleton<VerifyMailRepository>(
//       VerifyMailRepositoryImpl(locator()));
//   locator.registerSingleton<LoginRepository>(LoginRepositoryImpl(locator()));
//   locator
//       .registerSingleton<GetUserRepository>(GetUserRepositoryImpl(locator()));
//   locator.registerSingleton<GeneralInfoRepository>(
//       GeneralInfoRepositoryImpl(locator()));
//   locator.registerSingleton<OrderInfoRepository>(
//       OrderInfoRepositoryImpl(locator()));
//   locator.registerSingleton<GetInfoSymbolRepository>(
//       GetInfoSymbolRepositoryImpl(locator()));

//   //use case
//   locator.registerSingleton<RegisterUseCase>(RegisterUseCase(locator()));
//   locator
//       .registerSingleton<VerifyMobileUseCase>(VerifyMobileUseCase(locator()));
//   locator.registerSingleton<VerifyMailUseCase>(VerifyMailUseCase(locator()));
//   locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
//   locator.registerSingleton<GetUserUseCase>(GetUserUseCase(locator()));
//   locator.registerSingleton<GeneralInfoUseCase>(GeneralInfoUseCase(locator()));
//   locator.registerSingleton<OrderInfoUseCase>(OrderInfoUseCase(locator()));
//   locator
//       .registerSingleton<GetInfoSymbolUseCase>(GetInfoSymbolUseCase(locator()));

//   //bloc
//   locator.registerSingleton<SingupBloc>(SingupBloc(locator()));
//   locator.registerSingleton<VerifyMobileBloc>(VerifyMobileBloc(locator()));
//   locator.registerSingleton<VerifyMailBloc>(VerifyMailBloc(locator()));
//   locator.registerSingleton<LoginBloc>(LoginBloc(locator()));
//   locator.registerSingleton<GetUserBloc>(GetUserBloc(locator()));
//   locator.registerSingleton<RootBloc>(RootBloc(locator()));
//   locator
//       .registerSingleton<SelectedCurrencyBloc>(SelectedCurrencyBloc(locator()));
//   locator.registerSingleton<GetInfoSymbolBloc>(GetInfoSymbolBloc(locator()));
// }
