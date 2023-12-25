def delete_na_fields(map):
    for key in list(map.keys()):
        if map[key] == "":
            del map[key]
        elif map[key] == "N/A":
            del map[key]
        elif map[key] == None:
            del map[key]
    return map
