import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HomeBloc>().add(const GetProductEvent());
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<HomeBloc>().add(const GetProductEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Repositories"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              if (state.posts.isEmpty) {
                return const Center(
                  child: Text("No Posts"),
                );
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax ? state.posts.length : state.posts.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? const LinearProgressIndicator()
                      : ProductWidget(data: state.posts[index]);
                },
              );
            case PostStatus.error:
              return Center(
                child: Text(state.errorMessage),
              );
          }
        },
      ),
    );
  }
}

class PaginationScrollController {
  late ScrollController scrollController;
  bool isLoading = false;
  bool stopLoading = false;
  int currentPage = 1;
  double boundaryOffset = 0.5;
  late Function loadAction;

  void init({Function? initAction, required Function loadAction}) {
    if (initAction != null) {
      initAction();
    }
    this.loadAction = loadAction;
    scrollController = ScrollController()..addListener(scrollListener);
  }

  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  void scrollListener() {
    if (!stopLoading) {
      //load more data
      if (scrollController.offset >= scrollController.position.maxScrollExtent * boundaryOffset && !isLoading) {
        isLoading = true;
        loadAction().then((shouldStop) {
          isLoading = false;
          currentPage++;
          boundaryOffset = 1 - 1 / (currentPage * 2);
          if (shouldStop == true) {
            stopLoading = true;
          }
        });
      }
    }
  }
}
