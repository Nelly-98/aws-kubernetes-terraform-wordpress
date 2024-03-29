import json
import requests
import boto3

def get_slack_webhook():
    # Créez un client Secrets Manager
    client = boto3.client('secretsmanager')

    secret_name = 'SlackWebhookURL'

    # Récupérez le secret
    get_secret_value_response = client.get_secret_value(SecretId=secret_name)

    # Les secrets sont retournés sous forme de chaîne JSON
    secret = get_secret_value_response['SecretString']

    # Convertir la chaîne en dictionnaire et récupérez l'URL
    secret_dict = json.loads(secret)
    return secret_dict['url']

def lambda_handler(event, context):
    # Utilisez la fonction pour récupérer l'URL du webhook
    SLACK_WEBHOOK_URL = get_slack_webhook()

    for record in event['Records']:
        message = record['Sns']['Message']
        
        slack_message = {
            'text': message
        }
        
        response = requests.post(SLACK_WEBHOOK_URL, data=json.dumps(slack_message), headers={'Content-Type': 'application/json'})
        
        if response.status_code != 200:
            raise ValueError(f"Request to Slack returned an error {response.status_code}, the response is:\n{response.text}")

    return {"statusCode": 200, "body": json.dumps("Message sent to Slack")}
