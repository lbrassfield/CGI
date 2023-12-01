from firebase_functions import https_fn
from firebase_admin import initialize_app
from google.cloud import secretmanager
from google.cloud import bigquery
from google.oauth2 import service_account
import json
import datetime 

initialize_app()


@https_fn.on_request()
def on_request_example(req: https_fn.Request) -> https_fn.Response:
    return https_fn.Response("Hello world!")

@https_fn.on_call()
def get_service_acct(req):
    try:
        secret_name = req.data.get("secret_name")  # Assuming the request includes "secret_name" key

        if not secret_name:
            raise https_fn.HttpsError(
                code=https_fn.FunctionsErrorCode.INVALID_ARGUMENT,
                message="Missing 'secret_name' parameter in the request."
            )
        # Use Google Cloud Client Library to access the secret
        secret_manager_client = secretmanager.SecretManagerServiceClient()
        name = f"projects/cascadia-growth-insights/secrets/{secret_name}/versions/latest"
        response = secret_manager_client.access_secret_version(name=name)
        secret_payload = response.payload.data.decode("UTF-8")

        # Your Firebase Function logic here
        data = secret_payload  # Replace with your JSON data

        return data
    except Exception as e:
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.INTERNAL,
            message="An error occurred: " + str(e)
        )

@https_fn.on_call()
def query_big_query(req):
    try:
        secret_name = req.data.get("args").get("secret_name")  # Assuming the request includes "secret_name" key
        query_string = req.data.get("args").get("query_string") # Assuming the request includes "secret_name" key

        if not secret_name or not query_string:
            raise https_fn.HttpsError(
                code=https_fn.FunctionsErrorCode.INVALID_ARGUMENT,
                message="Missing 'secret_name' or 'query_string' parameter in the request."
            )
        # Use Google Cloud Client Library to access the secret
        secret_manager_client = secretmanager.SecretManagerServiceClient()
        name = f"projects/cascadia-growth-insights/secrets/{secret_name}/versions/latest"
        response = secret_manager_client.access_secret_version(name=name)
        secret_payload = response.payload.data.decode("UTF-8")
        payload_dict = json.loads(secret_payload)

        creds = service_account.Credentials.from_service_account_info(info=payload_dict)

        client = bigquery.Client(credentials=creds)

        query_job = client.query(query_string)
        rows = query_job.result()
        schema = query_job.result().schema
        column_names = [field.name for field in schema]
        result_set = {'column_names': column_names, 'results':[tuple(row) for row in rows]}
        result_set_json = json.dumps(result_set, default=serialize_datetime)

        return result_set_json

    except Exception as e:
        raise https_fn.HttpsError(
            code=https_fn.FunctionsErrorCode.INTERNAL,
            message="An error occurred: " + str(e)
        )

def serialize_datetime(obj): 
    if isinstance(obj, datetime.datetime): 
        return obj.isoformat() 
    elif isinstance(obj, datetime.date):
        return obj.isoformat()
    raise TypeError("Type not serializable") 