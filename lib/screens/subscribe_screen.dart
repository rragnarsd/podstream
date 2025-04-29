import 'package:flutter/material.dart';
import 'package:podstream/screens/interest_screen.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscribe Authors')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Subscribe to your favorite authors and get the latest podcasts.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            SubScribeList(),
            OnboardingButtonBar(
              continueText: 'Continue',
              //TODO add continueWidget
              continueWidget: Text('hi'),
            ),
            SizedBox(height: 24),
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
                    const SizedBox(width: 12),
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

class SubscribeAuthorData {
  final String podCastName;
  final String podCastQty;
  final String image;

  SubscribeAuthorData({
    required this.podCastName,
    required this.podCastQty,
    required this.image,
  });
}

List<SubscribeAuthorData> subscribeAuthorData = [
  SubscribeAuthorData(
    podCastName: 'Podcast 1',
    podCastQty: '10',
    image: 'assets/avatar1.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 2',
    podCastQty: '100',
    image: 'assets/avatar2.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 3',
    podCastQty: '160',
    image: 'assets/avatar3.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 4',
    podCastQty: '1000',
    image: 'assets/avatar4.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 5',
    podCastQty: '10000',
    image: 'assets/avatar5.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 6',
    podCastQty: '90',
    image: 'assets/avatar6.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 7',
    podCastQty: '100',
    image: 'assets/avatar7.jpg',
  ),
  SubscribeAuthorData(
    podCastName: 'Podcast 2',
    podCastQty: '100',
    image: 'assets/avatar2.jpg',
  ),
];
