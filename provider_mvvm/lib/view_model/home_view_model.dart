import 'package:flutter/material.dart';
import 'package:provider_mvvm/data/response/api_response.dart';
import 'package:provider_mvvm/model/usa_population_model.dart';
import 'package:provider_mvvm/repository/usa_population_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final usaPopulationRepo = UsaPopulationRepository();

  ApiResponse<UsaPopulationModel> usaPopulationList = ApiResponse.loading();

  setUsaPopulation(ApiResponse<UsaPopulationModel> response) {
    usaPopulationList = response;
    notifyListeners();
  }

  Future<void> getUsaPopulationApi() async {
    setUsaPopulation(ApiResponse.loading());
    usaPopulationRepo.getUsaPopulationApi().then((value) {
      setUsaPopulation(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setUsaPopulation(ApiResponse.error(error.toString()));
    });
  }
}
