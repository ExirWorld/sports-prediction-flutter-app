import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/role_widget.dart';
import 'package:oxir_game/gen/assets.gen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          backgroundColor: WHITE_COLOR,
          elevation: 0,
          context: context,
          builder: (context) {
            return const CategoryList();
          },
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffEAF7FF),
          borderRadius: BorderRadius.circular(RADIUS_3x),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: padding_Internal1x),
        child: ValueListenableBuilder(
          valueListenable: CategoryList.categoryNameNotifire,
          builder: (context, value, child) {
            return NormalText(
              value ?? 'Select Category',
              textColorInLight: value != null
                  ? const Color(0xff302E43)
                  : const Color(0xff69A6CD),
            );
          },
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
  static ValueNotifier<String?> categoryIdNotifire = ValueNotifier(null);
  static ValueNotifier<String?> categoryNameNotifire = ValueNotifier(null);
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(CategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding_Internal4x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LargeBoldText(
                'دسته بندی ها',
                textColorInLight: Color(0xff494949),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Assets.icons.close.svg(),
              ),
            ],
          ),
          const VerticalSpace(vertical_spacing_4x),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is CategoryErrorState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is CategoryCompletedState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.categorysEntity.length,
                  itemBuilder: (context, index) {
                    final data = state.categorysEntity[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: vertical_spacing_1x,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          CategoryList.categoryIdNotifire.value =
                              data.categoryId.toString();
                          CategoryList.categoryNameNotifire.value =
                              data.categoryName.toString();
                          RoleList.roleIdNotifire.value = null;
                          RoleList.roleNameNotifire.value = null;
                          BlocProvider.of<AuthBloc>(context).add(RullsEvent(
                              categoriesRef:
                                  CategoryList.categoryIdNotifire.value!));
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAF7FF),
                            borderRadius: BorderRadius.circular(RADIUS_3x),
                          ),
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: padding_Foreign3x),
                          child: Row(
                            children: [
                              SvgPicture.network(
                                "${Constants.baseUrl}${data.categoryUrl}",
                                height: 25,
                                width: 25,
                              ),
                              const HorizontalSpace(horizantal_spacing_2x),
                              NormalBoldText(
                                data.categoryName!,
                                textColorInLight: const Color(0xff02629F),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
