import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/pages/tabs/radio_tab/cubit/radio_cubit.dart';
import 'package:islami/pages/tabs/radio_tab/cubit/radio_state.dart';
import 'package:islami/pages/tabs/radio_tab/widget/radio_loading_widget.dart';
import 'package:islami/pages/tabs/radio_tab/widget/radio_widget.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/responsive.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()..getData(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * context.screenWidthRatio,
              vertical: 20 * context.screenHeightRatio,
            ),
            child: Container(
              height: 40 * context.screenHeightRatio,
              decoration: BoxDecoration(
                color: AppColors.blackColor.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.goldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.blackColor,
                labelStyle: AppFonts.bold16Black,
                unselectedLabelColor: AppColors.whiteColor,
                unselectedLabelStyle: AppFonts.bold16White,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "Radio"),
                  Tab(text: "Reciters"),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [const RadioListView(), const RecitersListView()],
            ),
          ),
        ],
      ),
    );
  }
}

class RadioListView extends StatelessWidget {
  const RadioListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioLoading) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * context.screenWidthRatio,
              vertical: 10,
            ),
            itemCount: 5,
            separatorBuilder: (context, index) =>
                SizedBox(height: 15 * context.screenHeightRatio),
            itemBuilder: (context, index) => const RadioLoadingWidget(),
          );
        } else if (state is RadioError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (state is RadioSuccess) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * context.screenWidthRatio,
              vertical: 10,
            ),
            itemCount: state.radios.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: 15 * context.screenHeightRatio),
            itemBuilder: (context, index) {
              final radio = state.radios[index];
              final isThisPlaying =
                  state.playingRadioId == radio.id && state.isPlaying;

              return RadioItemWidget(
                name: radio.name ?? "",
                isThisPlaying: isThisPlaying,
                onPlayToggle: () {
                  context.read<RadioCubit>().toggleRadioPlay(
                    radio.id!,
                    radio.url!,
                  );
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class RecitersListView extends StatelessWidget {
  const RecitersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        if (state is RadioLoading) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * context.screenWidthRatio,
              vertical: 10,
            ),
            itemCount: 5,
            separatorBuilder: (context, index) =>
                SizedBox(height: 15 * context.screenHeightRatio),
            itemBuilder: (context, index) => const RadioLoadingWidget(),
          );
        } else if (state is RadioError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (state is RadioSuccess) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * context.screenWidthRatio,
              vertical: 10,
            ),
            itemCount: state.reciters.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: 15 * context.screenHeightRatio),
            itemBuilder: (context, index) {
              final reciter = state.reciters[index];
              final isThisPlaying =
                  state.playingReciterId == reciter.id && state.isPlaying;

              return RadioItemWidget(
                name: reciter.name ?? "",
                isThisPlaying: isThisPlaying,
                onPlayToggle: () {
                  if (reciter.moshaf != null && reciter.moshaf!.isNotEmpty) {
                    final serverUrl = reciter.moshaf![0].server;
                    if (serverUrl != null) {
                      context.read<RadioCubit>().toggleReciterPlay(
                        reciter.id!,
                        serverUrl,
                      );
                    }
                  }
                },
                onNext: () => context.read<RadioCubit>().playNextSurah(),
                onPrevious: () =>
                    context.read<RadioCubit>().playPreviousSurah(),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
