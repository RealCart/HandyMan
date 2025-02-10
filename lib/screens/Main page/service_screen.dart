import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/bloc/get_categories_bloc/get_categories_bloc.dart';
import 'package:handy_man/bloc/get_services_bloc/get_services_bloc.dart';
import 'package:handy_man/presentation/service_category_widget.dart';
import '../../presentation/inputs/search_input.dart';
import '../../utils/screen_size_extension.dart';

class ServiceScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
      builder: (context, categoriesState) {
        if (categoriesState is GetCategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xffF1C40F),
            ),
          );
        }

        if (categoriesState is GetCategoriesFailled) {
          return Text(
            "Ошибка при получении данных: ${categoriesState.errorMessage}",
          );
        }

        if (categoriesState is GetCategoriesSuccessfully) {
          return BlocBuilder<GetServicesBloc, GetServicesState>(
            builder: (context, servicesState) {
              if (servicesState is LoadingGetServicesState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffF1C40F),
                  ),
                );
              }

              if (servicesState is FailedGetServicesState) {
                return Text(
                  "Ошибка при получении сервисов: ${servicesState.errorMessage}",
                );
              }

              if (servicesState is SuccessfullyGetServicesState) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: const Color(0xffF1C40F),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                    title: const Text(
                      "Browse Category",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF1C40F),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: context.heightPercent(5.0),
                            bottom: context.heightPercent(20.0),
                            left: context.widthPercent(20.0),
                            right: context.widthPercent(20.0),
                          ),
                          child: SearchInput(
                            controller: searchController,
                            hintText: "Search",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.widthPercent(20.0),
                          ),
                          child: ListView.builder(
                            itemCount: categoriesState.data.length,
                            itemBuilder: (context, index) =>
                                SingleServiceCategory(
                              title: categoriesState.data[index]['name'],
                              singleService: servicesState.data.where((item) =>
                                  item['service_category_id'] ==
                                  categoriesState.data[index]['id']).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          );
        }

        return Container();
      },
    );
  }
}
