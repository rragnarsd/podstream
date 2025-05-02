import 'package:flutter/material.dart';
import 'package:podstream/local_data/subscribe_data.dart';
import 'package:podstream/screens/interest_screen.dart';
import 'package:podstream/utils/constants/pod_assets.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/widgets/buttons.dart';
import 'package:podstream/widgets/spacers.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(AppAssets.logo),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
        title: const Text(
          AppAssets.subscribeText1,
          style: PodTextStyles.bodyXLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      AppAssets.subscribeText2,

                      style: PodTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SliverAppSpacer(height: 12),
                const SubScribeList(),
              ],
            ),
          ),
          const OnboardingButtonBar(
            continueText: AppAssets.continueText,
            routePath: '/',
          ),
          const AppSpacer(height: 24),
        ],
      ),
    );
  }
}

class SubScribeList extends StatefulWidget {
  const SubScribeList({super.key});

  @override
  State<SubScribeList> createState() => _SubScribeListState();
}

class _SubScribeListState extends State<SubScribeList> {
  List<bool> isSelectedList = List<bool>.generate(
    subscribeAuthorData.length,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final authorData = subscribeAuthorData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        authorData.image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const AppSpacer(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authorData.podCastName,
                        style: PodTextStyles.bodyXLarge,
                      ),
                      Text(
                        authorData.podCastQty,
                        style: PodTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w800,
                          color: PodColors.textColor.withValues(alpha: .6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppIconButton(
                icon: isSelectedList[index] ? Icons.check : Icons.add,
                backgroundColor:
                    isSelectedList[index] ? PodColors.tealColor : null,
                iconColor: isSelectedList[index] ? PodColors.whiteColor : null,
                onPressed: () {
                  setState(() {
                    isSelectedList[index] = !isSelectedList[index];
                  });
                },
              ),
            ],
          ),
        );
      }, childCount: subscribeAuthorData.length),
    );
  }
}
