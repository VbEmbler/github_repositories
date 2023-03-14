import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget remoteError({
  required hasData,
    required bool isConnectionError,
    required String errorPrefix,
    required String errorMessage
}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!hasData)
          SvgPicture.asset('assets/images/empty.svg', height: 84, width: 84,)
        else if (isConnectionError)
          SvgPicture.asset('assets/images/connection_error.svg', height: 84, width: 84,)
        else
          SvgPicture.asset('assets/images/error.svg', height: 84, width: 84,),
        const SizedBox(height: 24),
        Text(errorPrefix,
            style: TextStyle(
              color: hasData ? const Color(0xFFCB4F4F) : const Color(0xFF58A6FF),
            )
        ),
        Text(
          textAlign: TextAlign.center,
          errorMessage,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        )
      ]
  );
}
