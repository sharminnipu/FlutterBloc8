import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_8/bloc/home_bloc.dart';
import 'package:flutter_bloc_8/connectivityService/connectivityService.dart';
import 'package:flutter_bloc_8/repository/repository_impl.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<RepositoryImpl>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Activities for bored people'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.activityName),
                  Text(state.activityType),
                  Text(
                    state.participants.toString(),
                  ),
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                    child: Text('LOAD NEXT'),
                  )
                ],
              );
            }
            if (state is HomeNoInternetState) {
              return Text('no internet :(');
            }
            return Container();
          },
        ),
      ),
    );
  }
}