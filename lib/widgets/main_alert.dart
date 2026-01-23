import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog({
  required String text,
  required String description,
  required String textButtonConfirm,
  required String textButtonCancel,
  required BuildContext context,
}) async {
  return await showDialog<bool>(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: AppColors.background,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: AppTextStyles.text18Bold),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTextStyles.text14,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(textButtonCancel),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.destructive,
                          ),
                          child: Text(textButtonConfirm),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ) ??
      false;
}
