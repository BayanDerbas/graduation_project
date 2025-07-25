import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';

class CustomServiceproviderprofile extends StatelessWidget {
  final String image;
  final String name;
  final String job;
  final String rating;
  final String experience;
  final String successCount;
  final String followerNum;
  final VoidCallback? onFavourite;
  final bool isFavourite;
  final bool isFollow;
  final VoidCallback? onFollow;
  final VoidCallback? onBook;
  final VoidCallback? onCall;
  final VoidCallback? onMessage;
  final List<String> followerImages;
  final String followers;
  final String description;
  final List<String> postImages;
  final List<String> realEstateImages;
  final List<Map<String, String>> discounts;

  const CustomServiceproviderprofile({
    super.key,
    required this.image,
    required this.name,
    required this.job,
    required this.rating,
    required this.experience,
    required this.successCount,
    this.onFavourite,
    this.isFavourite = false,
    this.isFollow = false,
    required this.onFollow,
    required this.onBook,
    required this.onMessage,
    required this.followerNum,
    required this.followerImages,
    required this.description,
    required this.followers,
    required this.postImages,
    required this.realEstateImages,
    required this.discounts,
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        image,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 80,
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AppImages.noImage,
                            width: 80,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: onFavourite,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.purple,
                        child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: AppColors.pureWhite,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                // Wrap the Column in Expanded to constrain its width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: Fonts.itim.copyWith(
                              color: AppColors.black,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          ),
                        ),
                        SizedBox(width: 10), // Reduce spacing
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              job,
                              style: Fonts.itim.copyWith(
                                color: AppColors.grey,
                                fontSize: 16,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Prevent overflow
                            ).padding(EdgeInsets.all(8)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                          size: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          rating,
                          style: Fonts.itim.copyWith(
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10), // Reduce spacing
                        Flexible(
                          child: Text(
                            "$experience سنوات من الخبرة",
                            style: Fonts.itim.copyWith(
                              color: AppColors.grey,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, color: AppColors.babySky, size: 18),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "$successCount تجربة ناجحة ",
                            style: Fonts.itim.copyWith(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          followerNum,
                          style: Fonts.itim.copyWith(
                            color: AppColors.purple,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "متابع",
                          style: Fonts.itim.copyWith(
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: AppColors.grey2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onMessage,
                child: Icon(Icons.mail, color: AppColors.deepNavy, size: 30),
              ),
              ElevatedButton(
                onPressed: onBook,
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: AppColors.grey2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.book, scale: 8),
                    SizedBox(width: 5),
                    Text(
                      "Book",
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: onCall,
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: AppColors.grey2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.callIcon, scale: 11),
                    SizedBox(width: 5),
                    Text(
                      "Call",
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: onFollow,
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: AppColors.deepNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  isFollow ? "Follow" : "Following",
                  style: Fonts.itim.copyWith(color: AppColors.pureWhite),
                ),
              ),
            ],
          ).padding(EdgeInsets.all(20)).scrollDirection(Axis.horizontal),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          if (followerImages.length >= 2)
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(followerImages[0]),
                      ),
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(followerImages[1]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Followed by $followers",
                    style: Fonts.itim.copyWith(
                      color: AppColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ).padding(EdgeInsets.only(left: 16)),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: Fonts.itim.copyWith(
                    color: AppColors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  textAlign: TextAlign.left,
                  style: Fonts.itim.copyWith(
                    color: AppColors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ).padding(EdgeInsets.only(left: 10)),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          DefaultTabController(
            length: job == "عقارات" ? 3 : 2,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.deepNavy,
                    unselectedLabelColor: AppColors.grey,
                    dividerColor: AppColors.pureWhite,
                    tabs: [
                      const Tab(text: 'posts'),
                      if (job == "عقارات") const Tab(text: 'real estates'),
                      const Tab(text: 'discounts'),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: TabBarView(
                      children: [
                        GridView.count(
                          crossAxisCount: 3,
                          padding: const EdgeInsets.all(10),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children:
                              postImages.asMap().entries.map((entry) {
                                final index = entry.key;
                                final imagePath = entry.value;
                                return GestureDetector(
                                  onTap: () {
                                    print(
                                      "تم الضغط على صورة البوست رقم: $index",
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),

                        if (job == "عقارات")
                          GridView.count(
                            crossAxisCount: 3,
                            padding: const EdgeInsets.all(10),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children:
                                realEstateImages.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final imagePath = entry.value;
                                  return GestureDetector(
                                    onTap: () {
                                      print(
                                        "تم الضغط على صورة العقار رقم: $index",
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),

                        GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 0.7,
                          padding: const EdgeInsets.all(5),
                          children:
                              discounts.asMap().entries.map((entry) {
                                final index = entry.key;
                                final discount = entry.value;
                                final colors = [
                                  AppColors.lavender,
                                  AppColors.softPink,
                                  AppColors.babySky,
                                  AppColors.aquaBlue,
                                  AppColors.goldenYellow,
                                  AppColors.purple,
                                ];
                                return GestureDetector(
                                  onTap: () {
                                    print(
                                      "تم الضغط على الخصم: ${discount['code']}",
                                    );
                                  },
                                  child: DiscountItem(
                                    discount: discount['discount']!,
                                    description: discount['description']!,
                                    code: discount['code']!,
                                    color: colors[index % colors.length],
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).padding(EdgeInsets.all(10)).scrollDirection(Axis.vertical),
    );
  }
}

class DiscountItem extends StatelessWidget {
  final String discount;
  final String description;
  final String code;
  final Color color;

  const DiscountItem({
    super.key,
    required this.discount,
    required this.description,
    this.code = '',
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.card_giftcard, color: AppColors.deepNavy, size: 30),
              const SizedBox(width: 6),
              Text(
                discount,
                style: Fonts.itim.copyWith(
                  color: AppColors.deepNavy,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 11),
          ),
          if (code.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              "الكود: $code",
              style: Fonts.itim.copyWith(
                color: AppColors.deepNavy,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
