import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/di/service_locator.dart';
import 'package:weather/feature/home/presentation/logic/get_all_jobs/get_all_jobs_cubit.dart';
import 'package:weather/feature/home/presentation/widgets/bottom_section.dart';
import 'package:weather/core/widgets/home_app_bar.dart';
import 'package:weather/feature/home/presentation/widgets/home_description.dart';
import 'package:weather/feature/home/presentation/widgets/jobs_list_view.dart';
import 'package:weather/feature/home/presentation/widgets/search_widget.dart';

class HomeJobView extends StatefulWidget {
  const HomeJobView({super.key});

  @override
  State<HomeJobView> createState() => _HomeJobViewState();
}

class _HomeJobViewState extends State<HomeJobView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<GetAllJobsCubit>()..getAllJobs(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        "Jobs",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      HomeDescription(),
                      SizedBox(height: 16),
                      SearchWidget(
                        controller: _searchController,
                        searchQuery: _searchQuery,
                        onSearchChanged: (value) {
                          setState(() {
                            _searchQuery = value.toLowerCase();
                          });
                        },
                        onClearSearch: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      ),
                      JobsListView(searchQuery: _searchQuery),
                    ],
                  ),
                ),
                BottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
