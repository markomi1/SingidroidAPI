//Takes 2 parm, current array and what to key to check for, example
// (JSON Arr,"KeyName")
//If the key exists in the array then it returns True othewise False
function checkIfKeyExists(KeyName, JSONArray) {
    var keys = findKeys(JSONArray);
    for (i = 0; i <= keys.length - 1; i++) {
        if (keys[i] == KeyName) {
            //console.log("Key exits at pos: " + i)
            return true
        }
    }
    console.log("Key doesn't exits")
    return false;
}


function findKeyPos(KeyName, JSONArray) {
    var keys = findKeys(JSONArray);
    for (i = 0; i <= keys.length - 1; i++) {
        if (keys[i] == KeyName) {

            return i
        }
    }
    console.log("Key doesn't exits")
    return -1;
}


function checkKeyValues(KeyName, arr, Value) { // Checks value of the given key array
    var keys = findKeys(arr)
    if (keys != 0) {
        var keyPos;
        var name = KeyName;
        for (i = 0; i <= keys.length - 1; i++) { //Locating key position in JSON array
            if (keys[i] == KeyName) {
                keyPos = i; //Upon locating breaking for loop as there can be only 1 key named like that
                break;
            }
        }
        var valueArrLen = arr[keyPos][KeyName].length - 1;
        var valueArr = arr[keyPos][KeyName]
        for (b = 0; b <= valueArrLen; b++) {
            if (valueArr[b] == Value) {
                return true
                break;
            }
        }
        return false;
    }
    return false;

}

function removeKey(KeyName, arr) {
    var keys = findKeys(arr) //If it fails, it returns false

    delete arr[KeyName];
    for (i = 0; i <= keys.length; i++) { //Locating key position in JSON array
        if (keys[i] == KeyName) {
            arr.splice(i, 1)
            break;
        }
    }
}


function keyValues(KeyName, arr) {

    var keys = findKeys(arr)
    if (keys != 0) {


        var keyPos;
        var name = KeyName;
        for (i = 0; i <= keys.length - 1; i++) { //Locating key position in JSON array
            if (keys[i] == KeyName) {
                keyPos = i; //Upon locating breaking for loop as there can be only 1 key named like that
                break;
            }
        }
        return arr[keyPos][KeyName]
    }
    return 0;
}

function findKeys(arr) {
    //var arr = JSON.parse(localStorage.getItem(StorageKey)) //Takes localStorage arr as input!
    if (arr == null) {
        return;
    }
    var arrLenght = arr.length - 1; //Real lenght of the array is -1
    var keyArr = [] //Stores keys
    var tempArr = [] //Stores Keys temporearly

    for (i = 0; i <= arrLenght; i++) {
        tempArr = Object.keys(arr[i]); //It returns array, so yea....
        keyArr[i] = tempArr[0]
    }
    return keyArr //Returns array with all the keys
}

function removeKeyValues(KeyName, arr, Value) { //Takes Array and returns the Array without give value, aka, removes it
    var keys = findKeys(arr) //If it fails, it returns false
    if (keys != 0) {
        var keyPos;
        var name = KeyName;
        for (i = 0; i <= keys.length - 1; i++) { //Locating key position in JSON array
            if (keys[i] == KeyName) {
                keyPos = i; //Upon locating breaking for loop as there can be only 1 key named like that
                break;
            }
        }
        var valueArrLen = arr[keyPos][KeyName].length - 1;
        var valueArr = arr[keyPos][KeyName]
        for (b = 0; b <= valueArrLen; b++) {
            if (valueArr[b] == Value) {

                return arr[keyPos][KeyName].splice(b, 1)

                break;
            }
        }
        return false;
    }
}
