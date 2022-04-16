Aws.config.update({ 
    region:      "eu-west-1",
    credentials: Aws::Credentials.new("AKIAZSW2OYBEFZLZWRU6", 
    "uTXQ0qcBKjM2sp2VtVXkqqL0bDZMkho8ndPVkr9j")
  })
  
  sqs = Aws::SQS::Client.new(
    region:      "eu-west-1",
    credentials: Aws::Credentials.new("AKIAZSW2OYBEFZLZWRU6", 
    "uTXQ0qcBKjM2sp2VtVXkqqL0bDZMkho8ndPVkr9j")
  )
  sqs.create_queue({queue_name: 'default'})