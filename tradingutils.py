def read_file(filename):
    lines = []
    
    with open(filename) as f:
        lines = f.readlines()

    return lines

def build_itemlist():
    cardfile = "info_cards.txt"
    itemfile = "item_table.txt"

    infocards = read_file(cardfile)
    unparsed_items = read_file(itemfile)

    items = []

    # column of info cards w/i item table
    infoCardCol1 = 7
    infoCardCol2 = 8
    infoCardCol3 = 9

    # Replace info card indices
    # with the info card
    for unparsed_item in unparsed_items:
        unparsed_list = unparsed_item.split(',')

        infoCard1 = int(unparsed_list[infoCardCol1]) - 1
        infoCard2 = int(unparsed_list[infoCardCol2]) - 1
        infoCard3 = int(unparsed_list[infoCardCol3]) - 1

        unparsed_list[infoCardCol1] = infocards[infoCard1].strip('\n')
        unparsed_list[infoCardCol2] = infocards[infoCard2].strip('\n')
        unparsed_list[infoCardCol3] = infocards[infoCard3].strip('\n')

        items.append(",".join(unparsed_list))

    return items
