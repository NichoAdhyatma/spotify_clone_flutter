import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/common/widgets/loader/app_loader.dart';
import 'package:spotify_clone/core/utils/sizedbox_ext.dart';
import 'package:spotify_clone/service_locator.dart';

import '../bloc/news_cubit/news_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        getSongsUseCase: sl(),
      )..loadSongs(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const AppLoader();
          }
          if (state is NewsErrorState) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          }
          if (state is NewsSuccessLoadState) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => 20.widthSB,
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                var song = state.songs[index];

                return SizedBox(
                  child: Padding(
                    padding: index != 0
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(
                            left: 20,
                          ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            song.cover,
                            width: 160,
                          ),
                        ),
                        10.heightSB,
                        Text(
                          song.title,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          song.artist,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
