import 'package:flutter/material.dart';
import 'package:islami/model/azkar_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class AzkarDetails extends StatefulWidget {
  const AzkarDetails({super.key});

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  List<AzkarModel> azkarList = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String title = args['title'];
    final String category = args['category'];

    if (isLoading) {
      loadAzkar(category);
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(title),
        toolbarHeight: 80 * context.screenHeightRatio,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.appSuraDetails,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.goldColor),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(
                    vertical: 20 * context.screenHeightRatio,
                    horizontal: 20 * context.screenWidthRatio,
                  ),
                  itemCount: azkarList.length,
                  separatorBuilder: (context, index) =>
                      const Divider(color: AppColors.goldColor),
                  itemBuilder: (context, index) {
                    final item = azkarList[index];
                    return AzkarItemWidget(item: item);
                  },
                ),
        ],
      ),
    );
  }

  Future<void> loadAzkar(String category) async {
    azkarList = await AzkarModel.getAzkar(category);
    setState(() {
      isLoading = false;
    });
  }
}

class AzkarItemWidget extends StatefulWidget {
  final AzkarModel item;
  const AzkarItemWidget({super.key, required this.item});

  @override
  State<AzkarItemWidget> createState() => _AzkarItemWidgetState();
}

class _AzkarItemWidgetState extends State<AzkarItemWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = int.tryParse(widget.item.count ?? "1") ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (counter > 0) {
          setState(() {
            counter--;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.item.content ?? "",
              style: AppFonts.bold20White,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            if (widget.item.description != null &&
                widget.item.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.item.description!,
                  style: AppFonts.bold14Gold,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.goldColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("$counter", style: AppFonts.bold20Black),
            ),
          ],
        ),
      ),
    );
  }
}
