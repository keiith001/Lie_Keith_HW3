<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OwnerController extends Controller
{
    public function getAll()
    {
        return response()->json(DB::table('owners')->get());
    }

    public function getOne($id)
    {
        $owner = DB::table('owners')->find($id);
        return response()->json($owner ?: ['message' => 'Owner not found'], $owner ? 200 : 404);
    }

    public function save(Request $request)
    {
        DB::table('owners')->insert([
            'name' => $request->input('name'),
            'bio' => $request->input('bio'),
            'job' => $request->input('job'),
            'created_at' => now(),
            'updated_at' => now()
        ]);
        return response()->json(['message' => 'Owner added']);
    }

    public function update($id, Request $request)
    {
        DB::table('owners')->where('id', $id)->update([
            'name' => $request->input('name'),
            'bio' => $request->input('bio'),
            'job' => $request->input('job'),
            'updated_at' => now()
        ]);
        return response()->json(['message' => 'Owner updated']);
    }

    public function delete($id)
    {
        DB::table('owners')->where('id', $id)->delete();
        return response()->json(['message' => 'Owner deleted']);
    }
}
