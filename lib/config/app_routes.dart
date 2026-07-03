import 'package:flutter/material.dart';

import '../views/dashboard/dashboard_page.dart';
import '../views/animal/animal_list_page.dart';
import '../views/animal/add_animal_page.dart';
import '../views/animal/edit_animal_page.dart';
import '../views/animal/animal_details_page.dart';
import '../views/statistics/statistics_page.dart';

class AppRoutes {
  static const dashboard = "/";

  static const animalList = "/animals";

  static const addAnimal = "/add";

  static const editAnimal = "/edit";

  static const animalDetails = "/details";

  static const statistics = "/statistics";

  static final routes = <String, WidgetBuilder>{
    dashboard: (_) => const DashboardPage(),

    animalList: (_) => const AnimalListPage(),

    addAnimal: (_) => const AddAnimalPage(),

    editAnimal: (_) => const EditAnimalPage(),

    animalDetails: (_) => const AnimalDetailsPage(),

    statistics: (_) => const StatisticsPage(),
  };
}
