import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haulix/app/app_color_scheme.dart';
import 'package:haulix/widgets/photo_card.dart';
import 'package:haulix/widgets/video_card.dart';
import 'package:haulix/resources/resources.dart';
import 'package:haulix/widgets/app_svg_picture.dart';
import 'package:haulix/app/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mediaTypeIndex = ValueNotifier(0);

  EdgeInsets get padding => MediaQuery.paddingOf(context);

  @override
  void dispose() {
    super.dispose();
    mediaTypeIndex.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12)
                .copyWith(top: padding.top, bottom: 12),
            decoration: BoxDecoration(
              color: color.secondaryTextColor.withAlpha(20),
            ),
            child: Column(
              children: [
                const PageUrlField(),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: mediaTypeIndex,
                  builder: (context, index, child) => Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        child: MediaTypeButton(
                          text: 'Все',
                          icon: Svgs.inbox,
                          onPressed: index == 0
                              ? null
                              : () => mediaTypeIndex.value = 0,
                        ),
                      ),

                      Expanded(
                        child: MediaTypeButton(
                          text: 'Видео',
                          icon: Svgs.camera,
                          onPressed: index == 1
                              ? null
                              : () => mediaTypeIndex.value = 1,
                        ),
                      ),

                      Expanded(
                        child: MediaTypeButton(
                          text: 'Фото',
                          icon: Svgs.image,
                          onPressed: index == 2
                              ? null
                              : () => mediaTypeIndex.value = 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8)
                  .copyWith(top: 12, bottom: 12 + padding.bottom),
              children: [
                const PhotoCard(image: Images.parrot, height: 380),
                const SizedBox(height: 12),
                const VideoCard(image: Images.squirrel, height: 380),
                const SizedBox(height: 12),
                const PhotoCard(image: Images.polarBear, height: 380),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MediaTypeButton extends StatelessWidget {
  const MediaTypeButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return CupertinoButton(
      onPressed: onPressed,
      color: color.cardColor,
      disabledColor: color.primary,
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          AppSvgPicture.asset(icon, color: color.primaryTextColor),
          const SizedBox(height: 2),
          Text(text, style: AppTextStyles.s16w500(color.primaryTextColor)),
        ],
      ),
    );
  }
}

class PageUrlField extends StatelessWidget {
  const PageUrlField({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: color.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.cardColor, width: 1.5),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: AppSvgPicture.asset(
              Svgs.link,
              size: 22,
              color: Color(0xFF9794A3),
            ),
          ),
          Expanded(
            child: TextField(
              cursorWidth: 3,
              cursorColor: color.primary,
              style: AppTextStyles.s18w500(color.primaryTextColor),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText: 'Вставь URL страницы...',
                hintStyle: AppTextStyles.s18w500(color.secondaryTextColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
