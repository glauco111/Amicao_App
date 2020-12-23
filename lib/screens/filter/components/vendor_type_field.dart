import 'package:amicao/screens/filter/components/section_title.dart';
import 'package:amicao/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VendorTypeField extends StatelessWidget {
  VendorTypeField(this.filter);
  final FilterStore filter;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle('Tipo de Anunciante'),
        Observer(builder: (_) {
          return Wrap(
            runSpacing: 4,
            // alignment: WrapAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (filter.isTypeParticular) {
                    if (filter.isTypeProfessional) {
                      filter.resetVendorType(VENDOR_TYPE_PARTICULAR);
                    } else {
                      filter.selectVendorType(VENDOR_TYPE_PROFESSIONAL);
                    }
                  } else {
                    filter.setVendorType(VENDOR_TYPE_PARTICULAR);
                  }
                },
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: filter.isTypeParticular
                            ? Colors.indigo
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                    color: filter.isTypeParticular
                        ? Colors.indigo
                        : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  //padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Particular',
                    style: TextStyle(
                        color: filter.isTypeParticular
                            ? Colors.white
                            : Colors.indigo,
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  if (filter.isTypeProfessional) {
                    if (filter.isTypeParticular) {
                      filter.resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                    } else {
                      filter.selectVendorType(VENDOR_TYPE_PARTICULAR);
                    }
                  } else {
                    filter.setVendorType(VENDOR_TYPE_PROFESSIONAL);
                  }
                },
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: filter.isTypeProfessional
                            ? Colors.indigo
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                    color: filter.isTypeProfessional
                        ? Colors.indigo
                        : Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  //padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Profissional',
                    style: TextStyle(
                        color: filter.isTypeProfessional
                            ? Colors.white
                            : Colors.indigo,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
