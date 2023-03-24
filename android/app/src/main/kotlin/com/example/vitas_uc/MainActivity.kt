package com.example.vitas_uc

import com.socsi.exception.SDKException
import com.socsi.smartposapi.card.CardReader
import com.socsi.smartposapi.card.IcCardSearchCallback
import com.socsi.smartposapi.card.MagCardSearchCallback
import com.socsi.smartposapi.card.RfSearchCallback
import com.socsi.smartposapi.magcard.CardInfo
import com.socsi.smartposapi.magcard.Magcard
import com.socsi.utils.Log
import io.flutter.embedding.android.FlutterActivity
import socsi.middleware.emvl2lib.EmvStartProcessParam


class MainActivity: FlutterActivity() {

    private fun searchCard() {
        try {
            val cardReader: CardReader = CardReader.getInstance()
            cardReader.setMagCardSearchCallback(object : MagCardSearchCallback() {
                fun onSearchResult(ret: Int) {
                    when (ret) {
                        0 -> {
                            var cardInfo: CardInfo? = null
                            try {
                                cardInfo = Magcard.getInstance().readUnEncryptTrack()
                            } catch (e: SDKException) {
                                e.printStackTrace()
                            }
                            updateResult(cardInfo.toString())
                        }
                        1 -> updateResult("read timeout")
                        else -> updateResult("read fail:$ret")
                    }
                    dismissDialog()
                }
            })
            cardReader.setIcCardSearchCallback(object : IcCardSearchCallback() {
                fun onSearchResult(ret: Int) {
                    when (ret) {
                        0 -> {
                            channelType = EmvStartProcessParam.EMV_API_CHANNEL_FROM_ICC
                            startProcess()
                            return
                        }
                        1 -> updateResult("read timeout")
                        2 -> updateResult("read fail: unknown card type")
                        else -> updateResult("read fail:$ret")
                    }
                    dismissDialog()
                }
            })
            cardReader.setRfSearchCallback(object : RfSearchCallback() {
                fun onSearchResult(
                    ret: Int,
                    cardType: Int,
                    SerialNumber: ByteArray?,
                    ATQA: ByteArray?
                ) {
                    Log.i("cardType", cardType.toString())
                    if (ret == 0) {
                        channelType = EmvStartProcessParam.EMV_API_CHANNEL_FORM_PICC
                        startProcess()
                        return
                    } else if (ret == 1) {
                        updateResult("read timeout")
                    } else {
                        updateResult("read fail:$ret")
                    }
                    dismissDialog()
                }
            })
            var type: Byte = 0x00
            type = (type or 0x01).toByte() //support magnetic card
            type = (type or 0x02).toByte() //support ic card
            type = (type or 0x04).toByte() //support non-contact card
            cardReader.searchCard(type, 20 * 1000)
        } catch (e: Exception) {
            e.printStackTrace()
            stopSearch()
            updateResult("search card fail")
            dismissDialog()
        }
    }
}
