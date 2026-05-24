from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app, raise_server_exceptions=False)

def test_customer_cannot_see_other_customer_order():
    response = client.get('/orders/order_123', headers={'X-Demo-User': 'other_customer'})
    assert response.status_code == 403
    assert response.json()['error']['code'] == 'ORDER_ACCESS_DENIED'

def test_security_demo_masks_pii():
    payload = client.get('/security/demo?role=customer').json()
    assert '***' in payload['pii_masking']['email']

