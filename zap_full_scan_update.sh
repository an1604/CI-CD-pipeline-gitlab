#!/bin/bash

ESCAPED_CI_PROJECT_DIR=$(sed -e 's/[&\\/]/\\&/g; s/$/\\/' -e '$s/\\$//' <<<"$CI_PROJECT_DIR")
sed -i "s/CI_PROJECT_DIR/$ESCAPED_CI_PROJECT_DIR/g" zap/zap_config.conf

ESCAPED_TARGET=$(sed -e 's/[&\\/]/\\&/g; s/$/\\/' -e '$s/\\$//' <<<"$TARGET_URL")
sed -i "s/TARGET/$ESCAPED_TARGET/g" zap/context.context

# Perform a full scan using ZAP directly
zap-full-scan.py -I -j -m 10 -T 60 \
  -t "$TARGET_URL" \
  -r $CI_PROJECT_DIR/$ZAP_REPORT.html \
  --hook=/zap/auth_hook.py \
  -z "auth.loginurl=$TARGET_URL \
      auth.username=$ZAP_USERNAME \
      auth.password=$ZAP_PASSWORD \
      auth.username_field=exampleInputEmail1 \
      auth.password_field=exampleInputPassword1 \
      auth.submit_field=submit \
      auth.exclude=$TARGET_URL/logout \
      auth.include=$TARGET_URL/*"

returnCode=0
if grep -q "Instances" $CI_PROJECT_DIR/$ZAP_ALERT_REPORT.md; then
  head -n 20 $CI_PROJECT_DIR/$ZAP_ALERT_REPORT.md
  echo "DAST RESULT: There are some vulnerabilities that ZAP has found (those visible here may not be the only ones). See the detailed report for more information."
  returnCode=1
fi

exit $returnCode
