{$mode objfpc}
program StrategyPatternDemo;

type
  TDiscountStrategy = class
  public
    function Apply(price: Double): Double; virtual; abstract;
  end;

  TNoDiscount = class(TDiscountStrategy)
  public
    function Apply(price: Double): Double; override;
  end;

  TPercentOffDiscount = class(TDiscountStrategy)
  private
    FPercent: Double;
  public
    constructor Create(percent: Double);
    function Apply(price: Double): Double; override;
  end;

function TNoDiscount.Apply(price: Double): Double;
begin
  Apply := price;
end;

constructor TPercentOffDiscount.Create(percent: Double);
begin
  FPercent := percent;
end;

function TPercentOffDiscount.Apply(price: Double): Double;
begin
  Apply := price - (price * FPercent / 100.0);
end;

type
  TCart = class
  public
    Discount: TDiscountStrategy;
    function Checkout(price: Double): Double;
  end;

function TCart.Checkout(price: Double): Double;
begin
  Checkout := Discount.Apply(price);
end;

var
  cart: TCart;
begin
  cart := TCart.Create;

  cart.Discount := TNoDiscount.Create;
  WriteLn(cart.Checkout(100.0):0:2);

  cart.Discount := TPercentOffDiscount.Create(20.0);
  WriteLn(cart.Checkout(100.0):0:2);
end.
