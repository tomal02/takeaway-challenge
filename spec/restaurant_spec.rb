require 'restaurant'

describe Restaurant do
  
  context '#add_meal' do
    it 'can add a meal to the order' do
      subject.add_meal("Curry")
      expect(subject.order).to eq([["Curry", 1]])
    end
  
    it 'can add multiple meals to the order' do
      subject.add_meal("Curry")
      subject.add_meal("Milkshake", 2)
      expect(subject.order).to eq([["Curry", 1], ["Milkshake", 2]])
    end
  end

  context '#place_order' do
    it 'can place order' do
      subject.add_meal("Fries")
      expect{ subject.place_order }.to output("Order, placed. You will receive a confirmation SMS.\n").to_stdout
    end
  
    it 'will not place an empty order' do
      expect{ subject.place_order }.to raise_error("Order empty, unable to place an empty order.")
    end
  end

  it 'shows the menu' do
    menu = "Fries - £2\nMilkshake - £4\n"
    expect { subject.display_menu }.to output(menu).to_stdout
  end

  it 'can print the order, plus the total cost' do
    subject.add_meal("Fries")
    subject.add_meal("Milkshake")
    expect { subject.display_order }.to output("1x Fries - £2\n1x Milkshake - £4\nOrder total: £6\n").to_stdout
  end
end
