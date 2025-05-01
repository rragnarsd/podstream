import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podstream/local_data/subscribe_data.dart';
import 'package:podstream/screens/home_screen.dart';
import 'package:podstream/screens/interest_screen.dart';
import 'package:podstream/utils/pod_assets.dart';
import 'package:podstream/widgets/spacers.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          AppAssets.subscribeText1,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          color: Colors.black,
          onPressed: () => context.pop(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppAssets.subscribeText2,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            AppSpacer(height: 12),
            SubScribeList(),
            OnboardingButtonBar(
              continueText: AppAssets.continueText,
              continueWidget: HomeScreen(),
            ),
            AppSpacer(height: 24),
          ],
        ),
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
    return Expanded(
      child: ListView.builder(
        itemCount: subscribeAuthorData.length,
        itemBuilder: (context, index) {
          final authorData = subscribeAuthorData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${authorData.podCastQty} Podcasts',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor:
                        isSelectedList[index] ? Colors.redAccent : Colors.white,
                    shape: CircleBorder(
                      side: BorderSide(width: isSelectedList[index] ? 0 : 3),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isSelectedList[index] = !isSelectedList[index];
                    });
                  },
                  icon: Icon(
                    isSelectedList[index] ? Icons.check : Icons.add,
                    color: isSelectedList[index] ? Colors.white : null,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
