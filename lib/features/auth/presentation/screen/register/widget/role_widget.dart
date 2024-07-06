import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/gen/assets.gen.dart';

class RoleWidget extends StatelessWidget {
  const RoleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              backgroundColor: const Color(0xff1b1e23),
              elevation: 0,
              context: context,
              builder: (context) {
                return const RoleList();
              },
            );
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff272a2f),
              borderRadius: BorderRadius.circular(RADIUS_3x),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: padding_Internal1x),
            child: ValueListenableBuilder(
              valueListenable: RoleList.roleNameNotifire,
              builder: (context, value, child) {
                return NormalText(
                  value ?? 'Choose Role',
                  textColorInLight:
                      value != null ? Colors.white : const Color(0xff888b90),
                );
              },
            ),
          ),
        ),
        const VerticalSpace(vertical_spacing_4x),
      ],
    );
  }
}

class RoleList extends StatelessWidget {
  const RoleList({
    super.key,
  });
  static ValueNotifier<String?> roleIdNotifire = ValueNotifier(null);
  static ValueNotifier<String?> roleNameNotifire = ValueNotifier(null);
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
                'Roles',
                textColorInLight: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Assets.icons.close.svg(color: Colors.white),
              ),
            ],
          ),
          const VerticalSpace(vertical_spacing_4x),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is RegisterErrorState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is RullsCompletedState) {
                return state.rullsEntity.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.rullsEntity.length,
                        itemBuilder: (context, index) {
                          final data = state.rullsEntity[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: vertical_spacing_1x,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                roleIdNotifire.value = data.rullsId.toString();
                                roleNameNotifire.value =
                                    data.rullName.toString();
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: const Color(0xff272a31),
                                  borderRadius:
                                      BorderRadius.circular(RADIUS_3x),
                                ),
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: padding_Foreign3x),
                                child: Row(
                                  children: [
                                    SvgPicture.network(
                                      '${Constants.baseUrl}${data.rullsUrl}',
                                      height: 25,
                                      width: 25,
                                    ),
                                    const HorizontalSpace(
                                        horizantal_spacing_2x),
                                    NormalBoldText(
                                      data.rullName!,
                                      textColorInLight: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [
                          const VerticalSpace(vertical_spacing_4x),
                          Assets.images.search.svg(height: 100, width: 100),
                          const VerticalSpace(vertical_spacing_4x),
                          const SmallText(
                            'There is no role defined for this category',
                          ),
                          const VerticalSpace(vertical_spacing_4x),
                        ],
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
