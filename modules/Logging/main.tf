resource "aws_cloudwatch_log_group" "trading_bot_logs" {
  name              = "/trading-bot/logs"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_stream" "trading_bot_stream" {
  name           = "trading-bot-stream"
  log_group_name = aws_cloudwatch_log_group.trading_bot_logs.name
}