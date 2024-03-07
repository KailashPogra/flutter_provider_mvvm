import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/data/response/status.dart';
import 'package:provider_mvvm/model/usa_population_model.dart';
import 'package:provider_mvvm/utils/routs/routs_name.dart';
import 'package:provider_mvvm/utils/utils.dart';
import 'package:provider_mvvm/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _homeViewModel.getUsaPopulationApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('usa population list'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => _homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          switch (value.usaPopulationList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Text(value.usaPopulationList.massage.toString()));

            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.usaPopulationList.data!.data!.length,
                  itemBuilder: (context, int index) {
                    print(value.usaPopulationList.data!.data!.length);
                    return Container(
                      height: 200,
                      child: Column(
                        children: [
                          Text(value.usaPopulationList.data!.data![index].idYear
                              .toString()),
                          Text(value.usaPopulationList.data!.data![index].nation
                              .toString()),
                          Text(value
                              .usaPopulationList.data!.data![index].population
                              .toString()),
                          Text(value
                              .usaPopulationList.data!.data![index].slugNation
                              .toString()),
                        ],
                      ),
                    );
                  });
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
