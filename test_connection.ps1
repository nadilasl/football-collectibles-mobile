# Test Django Server Connectivity
# Run this script to check if Django server is accessible from Flutter

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Testing Django Server Connectivity" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Test 1: Check if port 8000 is listening
Write-Host "[Test 1] Checking if port 8000 is open..." -ForegroundColor Yellow
$portOpen = Test-NetConnection -ComputerName 127.0.0.1 -Port 8000 -WarningAction SilentlyContinue
if ($portOpen.TcpTestSucceeded) {
    Write-Host "✅ Port 8000 is OPEN - Django might be running!" -ForegroundColor Green
} else {
    Write-Host "❌ Port 8000 is CLOSED - Django is NOT running!" -ForegroundColor Red
    Write-Host "   → Start Django: python manage.py runserver" -ForegroundColor Yellow
}
Write-Host ""

# Test 2: Try to access Django server via curl
Write-Host "[Test 2] Testing HTTP connection to Django..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000" -TimeoutSec 3 -UseBasicParsing -ErrorAction Stop
    Write-Host "✅ Django server is responding! Status: $($response.StatusCode)" -ForegroundColor Green
} catch {
    Write-Host "❌ Cannot connect to Django server!" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Yellow
}
Write-Host ""

# Test 3: Check if API endpoint exists
Write-Host "[Test 3] Testing /api/products/create/ endpoint..." -ForegroundColor Yellow
try {
    # Try to POST to endpoint (will likely fail with 403/401 but confirms endpoint exists)
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000/api/products/create/" `
        -Method POST `
        -TimeoutSec 3 `
        -UseBasicParsing `
        -ErrorAction Stop
    Write-Host "✅ Endpoint exists! Status: $($response.StatusCode)" -ForegroundColor Green
} catch {
    if ($_.Exception.Response.StatusCode.value__ -eq 403) {
        Write-Host "✅ Endpoint exists! (403 Forbidden - need to login first)" -ForegroundColor Green
    } elseif ($_.Exception.Response.StatusCode.value__ -eq 405) {
        Write-Host "✅ Endpoint exists! (405 Method Not Allowed)" -ForegroundColor Green
    } elseif ($_.Exception.Response.StatusCode.value__ -eq 404) {
        Write-Host "❌ Endpoint NOT FOUND (404)!" -ForegroundColor Red
        Write-Host "   → Create /api/products/create/ endpoint in Django" -ForegroundColor Yellow
    } else {
        Write-Host "⚠️  Endpoint status: $($_.Exception.Response.StatusCode.value__)" -ForegroundColor Yellow
    }
}
Write-Host ""

# Test 4: Check localhost vs 10.0.2.2
Write-Host "[Test 4] Network interface check..." -ForegroundColor Yellow
Write-Host "   Localhost (127.0.0.1): Used by Django server" -ForegroundColor Cyan
Write-Host "   10.0.2.2: Used by Android emulator to reach host" -ForegroundColor Cyan
Write-Host ""

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Summary & Next Steps" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

if ($portOpen.TcpTestSucceeded) {
    Write-Host "✅ Django server appears to be running" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Make sure endpoint /api/products/create/ exists in Django urls.py" -ForegroundColor White
    Write-Host "2. Check ALLOWED_HOSTS in settings.py includes: ['localhost', '127.0.0.1', '10.0.2.2']" -ForegroundColor White
    Write-Host "3. Try running Flutter app again: flutter run" -ForegroundColor White
} else {
    Write-Host "❌ Django server is NOT running!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Start Django server:" -ForegroundColor Yellow
    Write-Host "1. Open NEW terminal" -ForegroundColor White
    Write-Host "2. cd to your Django project folder" -ForegroundColor White
    Write-Host "3. Run: python manage.py runserver" -ForegroundColor White
    Write-Host "4. Keep that terminal open!" -ForegroundColor White
    Write-Host "5. Run this test script again" -ForegroundColor White
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
