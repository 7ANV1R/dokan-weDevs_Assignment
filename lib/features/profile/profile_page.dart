import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/error_ui_widget.dart';
import 'controller/profile_controller.dart';
import 'widgets/profile_shimmer.dart';
import 'widgets/profile_view.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final profileData = ref.watch(profileDataProvider);

    return Scaffold(
      body: profileData.when(
        data: (response) {
          return response.fold((l) {
            return ErrorUIWidget(
              message: l.toString(),
              onRetry: () {
                ref.invalidate(profileDataProvider);
              },
            );
          }, (profile) {
            return ProfileView(profile: profile);
          });
        },
        loading: () {
          return const ProfileShimmerUI();
        },
        error: (error, _) {
          return ErrorUIWidget(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(profileDataProvider);
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
