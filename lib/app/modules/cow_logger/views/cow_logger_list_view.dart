import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_controller.dart';

class CowLoggerListView extends GetView<CowLoggerController> {
  CowLoggerListView({super.key});

  bool loadLogs = Get.arguments['loadLogs'];

  @override
  Widget build(BuildContext context) {
    controller.loadLogs(loadLogs);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerListView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Get.toNamed(Routes.HOME)),
      ),
      body: Obx(
        () => Center(
          child: ListView.builder(
            itemCount: controller.list.value.length,
            itemBuilder: (context, index) {
              final String? userName = controller.list.value[index].name;
              final DateTime? date = controller.list.value[index].date;
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: CardFb1(
                  text: userName ?? "blank",
                  imageUrl: controller.list.value[index].image?.url,
                  subtitle: date!.toIso8601String(),
                  onPressed: () {
                    Get.toNamed(
                      Routes.COW_LOGGER_DETAILS,
                      arguments: {'log': controller.list.value[index]},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => {
              Get.toNamed(Routes.COW_LOGGER_DETAILS, arguments: {'log': null}),
            },
        tooltip: 'Add new log',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final String subtitle;
  final Function() onPressed;

  const CardFb1({
    required this.text,
    this.imageUrl,
    required this.subtitle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 20),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.05),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            InkWell(
              onTap: onPressed,
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                child:
                    imageUrl == null
                        ? Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        )
                        : CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Image.network(
                            imageUrl!,
                            height: 59,
                            fit: BoxFit.cover,
                          ),
                        ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class SocialPictureGroup extends StatelessWidget {
  const SocialPictureGroup({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.color,
    required this.onTap,
    this.width = 400,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final Color color;
  final Function onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                child: Image.network(imgUrl, fit: BoxFit.fitWidth),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  color: Colors.red,
                ),
                clipBehavior: Clip.antiAlias,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: width,
          child: LikeListTile(
            title: "Andre Hirata",
            likes: "130",
            subtitle: "103 Reviews",
            color: color,
          ),
        ),
      ],
    );
  }
}

class LikeListTile extends StatelessWidget {
  const LikeListTile({
    Key? key,
    required this.title,
    required this.likes,
    required this.subtitle,
    this.color = Colors.grey,
  }) : super(key: key);
  final String title;
  final String likes;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg",
                ),
              ),
            ),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          Icon(Icons.favorite, color: Colors.orange, size: 15),
          SizedBox(width: 2),
          Text(likes),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(width: 4, height: 4),
            ),
          ),
          Text(subtitle),
        ],
      ),
      trailing: LikeButton(onPressed: () {}, color: Colors.orange),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.onPressed,
    this.color = Colors.black12,
  }) : super(key: key);
  final Function onPressed;
  final Color color;
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color,
        ),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
          widget.onPressed();
        },
      ),
    );
  }
}
