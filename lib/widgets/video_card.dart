import 'package:flutter/material.dart';
import 'package:haulix/app/app_color_scheme.dart';
import 'package:haulix/resources/resources.dart';
import 'package:haulix/widgets/app_svg_picture.dart';
import 'package:haulix/app/app_text_styles.dart';

class VideoCard extends StatelessWidget {
  final String image;
  final double height;

  const VideoCard({super.key, required this.image, required this.height});

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
                  Image.asset(image, fit: BoxFit.fill),

                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: color.primary.withAlpha(95),
                        borderRadius: BorderRadius.circular(8),

                        border: Border.all(color: color.primary, width: 1.5),
                      ),
                      child: Row(
                        spacing: 5,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppSvgPicture.asset(
                            Svgs.camera,
                            size: 20,
                            color: color.primaryTextColor,
                          ),

                          Text(
                            'VIDEO',
                            style: AppTextStyles.s16w800(
                              color.primaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: color.primary.withAlpha(180),
                        shape: BoxShape.circle,
                        border: Border.all(color: color.primary, width: 1.5),
                      ),
                      child: AppSvgPicture.asset(
                        Svgs.play,
                        size: 30,
                        color: color.primaryTextColor.withAlpha(220),
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
                  style: AppTextStyles.s18w700(color.primaryTextColor),
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
                            width: 1.5,
                            color: color.secondaryTextColor.withAlpha(100),
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
                          color: const Color(0xFF09090D),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFF25222C),
                            width: 1.5,
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
                              style: AppTextStyles.s18w700(Colors.white),
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
