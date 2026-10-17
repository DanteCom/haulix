import 'package:flutter/material.dart';
import 'package:haulix/app/app_color_scheme.dart';
import 'package:haulix/resources/resources.dart';
import 'package:haulix/widgets/app_svg_picture.dart';
import 'package:haulix/app/app_text_styles.dart';

class PhotoCard extends StatelessWidget {
  final String image;
  final double height;

  const PhotoCard({super.key, required this.image, required this.height});

  final double borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Container(
      height: height,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color.cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.5)
                  .copyWith(top: 2.5),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(image),

                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: color.backgroundColor,
                        borderRadius: BorderRadius.circular(8),

                        border: Border.all(
                          color: color.secondaryTextColor.withAlpha(100),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        spacing: 5,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppSvgPicture.asset(
                            Svgs.image,
                            size: 20,
                            color: color.primaryTextColor,
                          ),

                          Text(
                            'PHOTO',
                            style: AppTextStyles.s16w800(
                              color.primaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cyberpunk City Dusk - Cinematic 4K Stream',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s18w700(Colors.white),
                ),

                const SizedBox(height: 10),

                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: color.secondaryTextColor.withAlpha(80),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dimension',
                              style: AppTextStyles.s16w500(color.primary),
                            ),
                            Text(
                              '3840x2160',
                              style: AppTextStyles.s18w700(
                                color.primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: color.secondaryTextColor.withAlpha(80),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'File Weight',
                              style: AppTextStyles.s16w500(color.secondary),
                            ),
                            Text(
                              '54.8 MB',
                              style: AppTextStyles.s18w700(
                                color.primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
