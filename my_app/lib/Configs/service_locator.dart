import 'package:map_mvvm/app/service_locator.dart';
import 'package:my_app/Booking/models/user.dart';
import 'package:my_app/Booking/services/booking/booking_service.dart';
import 'package:my_app/Booking/services/booking/booking_service_impl_memory.dart';
import 'package:my_app/Booking/services/history/history_service.dart';
import 'package:my_app/Booking/services/schedule/schedule_service.dart';
import 'package:my_app/Booking/services/user/user_service.dart';
import 'package:my_app/Booking/services/user/user_service_memory_impl.dart';
import 'package:my_app/Booking/views/booking/barber/booking_barber_viewmodel.dart';
import 'package:my_app/Booking/views/booking/booking_viewmodel.dart';
import 'package:my_app/Booking/views/history/history_viewmodel.dart';
import 'package:my_app/Booking/views/schedule/schedule_viewmodel.dart';
import 'package:my_app/Customer_Booking/services/booking/booking_service.dart';
import 'package:my_app/Customer_Booking/services/booking/booking_service_impl_memory.dart';
import 'package:my_app/Customer_Booking/services/bookingdetail/bookingdetail_impl_memory.dart';
import 'package:my_app/Customer_Booking/services/bookingdetail/bookingdetail_service.dart';
import 'package:my_app/Customer_Booking/services/home/home_service.dart';
import 'package:my_app/Customer_Booking/services/home/home_service_impl.dart';
import 'package:my_app/Customer_Booking/services/user/user_service.dart';
import 'package:my_app/Customer_Booking/services/user/user_service_impl.dart';
import 'package:my_app/Customer_Booking/views/home/home_viewmodel.dart';
import 'package:my_app/Login/Services/Login/LoginService.dart';
import 'package:my_app/Login/Services/Register_Service/RegisterService.dart';
import 'package:my_app/Login/Services/Register_Service/Register_Service_Memory_impl.dart';
import 'package:my_app/Login/View/login/loginViewModel.dart';
import 'package:my_app/Login/View/register/RegistrationViewModel.dart';
import 'package:my_app/Payment/View/Payment/payment_view_model.dart';
import 'package:my_app/User_Profile/View_Model/userprofile_viewmodel.dart';
import '../Login/Services/Login/Login_Service_Memory_impl.dart';
import 'package:get_it/get_it.dart';

/*
final locator = ServiceLocator.locator;

void initializeServiceLocator() {
// Register Services
  locator.registerLazySingleton<LoginServiceMemoryImpl>(() => LoginServiceMemoryImpl());
  // locator.registerLazySingleton<CounterService>(() => CounterService_Rest());

// Register Viewmodels
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  
  // Registration
  locator.registerLazySingleton<RegisterServiceMemoryImpl>(() => RegisterServiceMemoryImpl());


} */

final locator = GetIt.instance;
void initializeServiceLocator() {
  // Login
  locator.registerLazySingleton<LoginService>(() => LoginServiceMemoryImpl());
  locator.registerLazySingleton<LoginServiceMemoryImpl>(
      () => LoginServiceMemoryImpl());
  locator.registerLazySingleton<RegisterService>(
      () => RegisterServiceMemoryImpl());
  locator.registerLazySingleton<RegisterServiceMemoryImpl>(
      () => RegisterServiceMemoryImpl());

// Register Viewmodels
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<RegisterViewModel>(() => RegisterViewModel());

  // payment
  locator.registerLazySingleton<PaymentViewModel>(() => PaymentViewModel());

  // Register Services

  locator.registerLazySingleton<UserService>(() => UserServiceMemoryImpl());
  locator
      .registerLazySingleton<BookingService>(() => BookingServiceImplMemory());
  locator.registerLazySingleton<ScheduleService>(
      () => ScheduleService(schedules: []));
  locator.registerLazySingleton<HistoryService>(
      () => HistoryService(histories: []));

  // Create a User object (you may need to replace this with your actual user data)

  User user = User(
      id: "1",
      name: "name",
      role: "role",
      starRating: 5,
      description: "description");

  // Register Viewmodels
  locator.registerLazySingleton<BookingBarberViewmodel>(
      () => BookingBarberViewmodel());
  locator.registerLazySingleton<BookingViewModel>(
      () => BookingViewModel(user: user));
  locator.registerLazySingleton<ScheduleViewModel>(() => ScheduleViewModel());
  locator.registerFactory(() => HistoryViewModel(
        historyService: locator<HistoryService>(),
      ));

  // Haziq
  locator.registerLazySingleton<UserServiceCustomer>(
      () => UserServiceCustomerMemoryImpl());
  locator.registerLazySingleton<BookingServiceCustomer>(
      () => BookingServiceCustomerImplMemory());
  locator.registerLazySingleton<HomeServiceCustomer>(
      () => HomeServiceCustomerImpl());
  locator.registerLazySingleton<BookingDetailServiceCustomer>(
      () => BookingDetailCustomerServiceImpl());
  locator.registerLazySingleton<HomeViewModel>(
      () => HomeViewModel());

  locator.registerLazySingleton<UserProfileViewModel>(
      () => UserProfileViewModel());
}
