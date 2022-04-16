module Workers
  class NewRegistrationWorker
    include Shoryuken::Worker
    shoryuken_options queue: QUEUE_NAME, auto_delete: true, body_parser: JSON

    def perform(_sqs_msg, body)

      account = Account.new(    {
        "account" => { "name" => body.fetch(":name_account") },
        "entity" => [
          {
            "name_entity" => body.fetch(":name_entity")
          },
        ],
      })
      account.create(:name_account =>body.fetch(":name_account"),  :name_entity => body.fetch(":name_entity"))
    end
  end
end
