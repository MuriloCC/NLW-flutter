import 'package:flutter/material.dart';
import 'package:nlw_flutter/modules/extract_page/extract_page.dart';
import 'package:nlw_flutter/modules/home/home_controller.dart';
import 'package:nlw_flutter/modules/meus_boletos/meus_boletos_page.dart';
import 'package:nlw_flutter/shared/models/boleto_model.dart';
import 'package:nlw_flutter/shared/models/user_model.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/boleto_list/boleto_list_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final controller = BoletoListController();

  final pages = [
    MeusBoletosPage(
      key: UniqueKey(),
    ),
    ExtractPage(
      key: UniqueKey(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Olá, ",
                  style: AppTextStyle.titleRegular,
                  children: [
                    TextSpan(
                      text: widget.user.name,
                      style: AppTextStyle.titleBoldBackground,
                    )
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia.',
                style: AppTextStyle.captionShape,
              ),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoUrl.toString()),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                homeController.setPage(0);
                setState(() {});
              },
              icon: const Icon(Icons.home),
              color: homeController.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, "/insert_boleto");
                setState(() {});
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: AppColors.shape,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                homeController.setPage(1);
                setState(() {});
              },
              icon: const Icon(Icons.description_outlined),
              color: homeController.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}
