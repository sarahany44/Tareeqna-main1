import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Home/domain/usecases/get_user_location_usecase.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetUserLocationUseCase getUserLocationUseCase;

  LocationCubit(this.getUserLocationUseCase) : super(LocationInitial());

  Future<void> fetchLocation() async {
    emit(LocationLoading());
    try {
      final location = await getUserLocationUseCase();
      emit(LocationLoaded(location));
    } catch (e) {
      if (e.toString().contains('disabled')) {

       //if the user opens the site after it was rejected, we will try again after a short time
       
        await Future.delayed(const Duration(seconds: 2));
        fetchLocation(); // Retry
      } else {
        emit(LocationError("Failed to get location: $e"));
      }
    }
  }
}
